From: "Chidambaram, Praveen" <pchidamb@codeaurora.org>
Subject: Ondemand configurable down_differential?
Date: Thu, 26 Aug 2010 09:50:23 -0600 (MDT)
Message-ID: <alpine.DEB.2.00.1008260941420.7370@pchidamb-lnx.qualcomm.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org


Hi,

Its been observed that the ondemand parameter down_differential 
(currently a default of 10) could provide a lot of help with power 
savings. The common use cases of Multimedia playback, causes the CPU 
to bump up and would soon drop off to a lower frequency and might ping 
pong as load varies in a short time. If the down_differential was say 
30 or so, the CPU stays higher longer, but the ping pong effect is 
gone and there is better power distribution. It would be great to have 
this configurable.
 
What is the consensus behind a configurable down_differential?


Thanks
Praveen

Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
