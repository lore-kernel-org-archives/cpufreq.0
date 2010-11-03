From: "Chidambaram, Praveen" <pchidamb@codeaurora.org>
Subject: per_cpu Userspace mutex
Date: Wed, 3 Nov 2010 16:23:52 -0600 (MDT)
Message-ID: <alpine.DEB.2.00.1011031619140.5066@pchidamb-lnx.qualcomm.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, venkatesh.pallipadi@intel.com
Cc: bryanh@codeaurora.org, waynelee@codeaurora.org

Hello,

Seems in cpufreq_userspace.c the userspace_mutex is common for all 
CPUs using userspace code to change cpu frequency and could possibly 
slow down the frequency change on all other cpus. 

Can we have per_cpu mutex so that access to one cpu does not hold up 
other cpus.

Thanks,
Praveen

Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
