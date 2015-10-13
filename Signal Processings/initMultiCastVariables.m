
maxObj = 1e4;
epsilonT = 1e-5;
enableBreak = 0;
objWeight = 1e-4;
singleBandCheck = 0;
lowEpsilon = 1e-10;

cH = SimStructs.linkChan;
nBases = SimParams.nBases;
nBands = SimParams.nBands;
nUsers = SimParams.nUsers;
QueuedPkts = zeros(nUsers,1);
reqSINRPerUser = zeros(nUsers,1);
iterateSCAMax = SimParams.nExchangesOTA;

searchType = 'Dual';
xRandIterations = 100;

for iBase = 1:nBases
    linkedUsers = SimStructs.baseStruct{iBase,1}.linkedUsers;
    for iUser = 1:length(linkedUsers)
        cUser = linkedUsers(iUser,1);
        QueuedPkts(cUser,1) = SimStructs.userStruct{cUser,1}.trafficStats.backLogPkt;
        reqSINRPerUser(cUser,1) = 2^(QueuedPkts(cUser,1)) - 1;
    end
end

QueuedNats = QueuedPkts * log(2);
nGroupsPerCell = zeros(SimParams.nBases,1);
for iBase = 1:nBases
    nGroupsPerCell(iBase,1) = length(SimParams.mcGroups{iBase,1});
end

gReqSINRPerUser = (reqSINRPerUser + 1).^(1 / nBands);
gxReqSINRPerUser = (reqSINRPerUser + 1);
