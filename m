From: Martin Ziegler <ziegler@email.mathematik.uni-freiburg.de>
Subject: Re: [PATCH] cpufreq: fix garbage kobj on errors during
 suspend/resume
Date: Tue, 10 Dec 2013 17:02:33 +0100
Message-ID: <alpine.DEB.2.10.1312101710260.2743@zertz.mathematik.uni-freiburg.de>
References: <1386069272-9250-1-git-send-email-bjorn@mork.no> <529F04B2.7050303@linaro.org> <2628468.jr1aJZyvPu@vostro.rjw.lan> <CAOLK0pxW_AjtGNwW2G8-1SpJbYs_GWQDLV=7XzPfDHRj6tCxQQ@mail.gmail.com> <52A567A6.6000400@linux.vnet.ibm.com>
Reply-To: Martin Ziegler <ziegler@uni-freiburg.de>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <52A567A6.6000400@linux.vnet.ibm.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Cc: Lan Tianyu <lantianyu1986@gmail.com>, ziegler@uni-freiburg.de, "Rafael J. Wysocki" <rjw@rjwysocki.net>, viresh kumar <viresh.kumar@linaro.org>, =?ISO-8859-15?Q?Bj=F8rn_Mork?= <bjorn@mork.no>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, martin.ziegler@math.uni-freiburg.de

On my machine

CPU offline:
echo 0 > /sys/devices/system/cpu/cpu<num>/online

CPU online:
echo 1 > /sys/devices/system/cpu/cpu<num>/online

works fine with 3.13-rc3.

Regards

Martin
