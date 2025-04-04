#ifdef QT_DEBUG
    #include <QDebug>
#endif

#include "proxy.hpp"

// Constructors, Init, ShutDown, Destructor
// [[------------------------------------------------------------------------]]
// [[------------------------------------------------------------------------]]

Proxy::Proxy(QObject *parent) :
    QSortFilterProxyModel(parent)
    , m_FilterStatus (true)
    , m_SensitivityStatus(true)
    , m_FilterValue("")
    , m_RoleText("")
{
#ifdef QT_DEBUG
    qDebug() << "objectName :" << this->objectName();
    qDebug() << "Arguments  :" << "None";
    qDebug() << "Log Output :" << "None";
#endif
}

Proxy::~Proxy()
{
#ifdef QT_DEBUG
    qDebug() << "objectName :" << this->objectName();
    qDebug() << "Arguments  :" << "None";
    qDebug() << "Log Output :" << "None";
#endif
}

// [[------------------------------------------------------------------------]]
// [[------------------------------------------------------------------------]]





// PUBLIC Methods
// [[------------------------------------------------------------------------]]
// [[------------------------------------------------------------------------]]

QVariantMap Proxy::get(int proxyRow) const
{
    QModelIndex proxyIndex = index(proxyRow, 0);
    QModelIndex sourceIndex = mapToSource(proxyIndex);

    QVariantMap itemMap;

    const auto roles = roleNames();
    for (auto it = roles.constBegin(); it != roles.constEnd(); ++it)
    {
        itemMap.insert(
            QString::fromUtf8(it.value()),
            sourceModel()->data(sourceIndex, it.key())
        );
    }

    return (itemMap);
}

void Proxy::refresh()
{
    invalidate();
}

// [[------------------------------------------------------------------------]]
// [[------------------------------------------------------------------------]]





// PRIVATE Methods
// [[------------------------------------------------------------------------]]
// [[------------------------------------------------------------------------]]

int Proxy::mapToRole(const QString &role) const
{
    int roleIndex = sourceModel()->roleNames().key(role.toUtf8(), Qt::DisplayRole);

    return (roleIndex);
}

// [[------------------------------------------------------------------------]]
// [[------------------------------------------------------------------------]]





// PUBLIC Getters
// [[------------------------------------------------------------------------]]
// [[------------------------------------------------------------------------]]

bool Proxy::getFilterStatus() const
{
    return (m_FilterStatus);
}

bool Proxy::getSensitivityStatus() const
{
    return (m_SensitivityStatus);
}

QString Proxy::getFilterValue() const
{
    return (m_FilterValue);
}

QString Proxy::getRoleText() const
{
    return (m_RoleText);
}

// [[------------------------------------------------------------------------]]
// [[------------------------------------------------------------------------]]





// PUBLIC Setters
// [[------------------------------------------------------------------------]]
// [[------------------------------------------------------------------------]]

void Proxy::setFilterStatus(bool newFilterStatus)
{
    if (m_FilterStatus == newFilterStatus)
    {
        return;
    }

    m_FilterStatus = newFilterStatus;
    emit filterStatusChanged();

    // Force filter to update:
    invalidateFilter();
}

void Proxy::setSensitivityStatus(bool newSensitivityStatus)
{
    if (m_SensitivityStatus == newSensitivityStatus)
    {
        return;
    }

    m_SensitivityStatus = newSensitivityStatus;
    emit sensitivityStatusChanged();

    // Force filter to update:
    invalidateFilter();
}

void Proxy::setFilterValue(const QString &newFilterValue)
{
    if (m_FilterValue == newFilterValue)
    {
        return;
    }

    m_FilterValue = newFilterValue;
    emit filterValueChanged();

    // Force filter to update:
    invalidateFilter();
}

void Proxy::setRoleText(const QString &newRoleText)
{
    if (m_RoleText == newRoleText)
    {
        return;
    }

    m_RoleText = newRoleText;
    emit roleTextChanged();

    // Force filter to update:
    invalidateFilter();
}

// [[------------------------------------------------------------------------]]
// [[------------------------------------------------------------------------]]





// OVERRIDES
// [[------------------------------------------------------------------------]]
// [[------------------------------------------------------------------------]]

bool Proxy::filterAcceptsRow(int sourceRow, const QModelIndex &sourceParent) const
{
    if (m_FilterStatus == false)
    {
        return (true); // Accept all rows
    }

    if(m_FilterValue == "")
    {
        return (true); // Accept all rows
    }

    if(m_RoleText == "")
    {
        return (true); // Accept all rows
    }

    QString data = sourceModel()->data(
        sourceModel()->index(sourceRow, 0, sourceParent),
        mapToRole(m_RoleText)
    ).toString();

#ifdef QT_DEBUG
    qDebug() << "Data found: " << data;
#endif

    return m_SensitivityStatus ? data.contains(m_FilterValue, Qt::CaseSensitive) : data.contains(m_FilterValue, Qt::CaseInsensitive);
}

// [[------------------------------------------------------------------------]]
// [[------------------------------------------------------------------------]]
