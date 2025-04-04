#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QClipboard>

#include "syntax_highlighter.hpp"
#include "file_io.hpp"
#include "clipboard.hpp"
#include "proxy.hpp"

void registerTypes();
void registerContexts(QQmlApplicationEngine &engine);

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setOrganizationName("UFOCoder");
    app.setOrganizationDomain("ufocoder.com");
    app.setApplicationName("Blog");

    registerTypes();

    QQmlApplicationEngine engine;

    registerContexts(engine);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("Blog", "Main");

    return app.exec();
}

void registerTypes()
{
    qmlRegisterType<SyntaxHighlighter>("SyntaxHighlighter", 1, 0, "SyntaxHighlighter");
    qmlRegisterType<FileIO>("FileIO", 1, 0, "FileIO");
    qmlRegisterType<Proxy>("Proxy", 1, 0, "Proxy");
}

void registerContexts(QQmlApplicationEngine &engine)
{
    Clipboard *clipboard = new Clipboard(&engine);
    clipboard->setClipboard(QGuiApplication::clipboard());

    engine.rootContext()->setContextProperty("contextClipboard", clipboard);
}
