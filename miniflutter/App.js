/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */
import React from 'react';

import {
  Button,
  SafeAreaView,
  ScrollView,
  StatusBar,
  useColorScheme,
  ActivityIndicator
} from 'react-native';



import { Colors, Header } from 'react-native/Libraries/NewAppScreen';

import  { FlutterModuleRn  } from 'flutter-module-rn';
import { View } from 'react-native';

const testNetWork = ()=>{
  console.log("testNetWork");
  fetch('https://reactnative.dev/movies.json')
    .then(response => response.json())
    .then(json => {
      console.log(json.movies);
    })
    .catch(error => {
      console.error(error);
    });
}

const startFlutterScreen = async() => {
  const data = {
    'accessToken': "son",
    'refreshToken': "123",
    'devMode': true,
    'ip':'192.168.1.42'
  }

  //Todo 
// pass config wwebconsole from here 



//config debug miniapp 
// String nameFile = "app_live.mpk";
// final String ip = '192.168.1.7';
// //final String ip = '';
// final String packageId = 'com.mbbank.bee_voice';
// final bool devMode = true;

  const params = JSON.stringify(data);
  const res =  await FlutterModuleRn.startFlutterActivity('',params, 0, (text) => {
    console.log(text);
  });
  console.log('123');
};

const App = () => {
  const isDarkMode = useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };

  return (
    <SafeAreaView style={backgroundStyle}>
      <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
      <ScrollView
        contentInsetAdjustmentBehavior="automatic"
        style={backgroundStyle}>
        <Header />
        {/* <FlutterModuleRnView style={{backgroundColor:'green',width:40,height:40}} /> */}
        <Button title={'Start Flutter Screen'} onPress={startFlutterScreen} />
        <View style={{height:10}} />
        <Button title={'Start Testnetwork'} onPress={testNetWork} />
      </ScrollView>
    </SafeAreaView>
  );
};

export default App;