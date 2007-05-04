From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: cpufreq longhaul locks up
Date: Sat, 5 May 2007 01:32:04 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705050130090.18504@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr> 
 <1178311052.6094.0.camel@localhost.localdomain> 
 <Pine.LNX.4.61.0705042259160.18504@yvahk01.tjqt.qr>
 <1178318978.6094.29.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1161558AbXEDXd4@vger.kernel.org>
In-Reply-To: <1178318978.6094.29.camel@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: john stultz <johnstul@us.ibm.com>
Cc: davej@codemonkey.org.uk, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk


On May 4 2007 15:49, john stultz wrote:
>
>> Switching from acpi_pm+performance to acpi_pm+ondemand also
>> locks up after a few minutes.
>
>Yep. Sounds like an ondemand issue. Thanks for verifying this for me.

Nah, it also happens with cpufreq_powersave. I just need to check 
through some archives and try booting with governor=powersave so that it 
always stays low. Though, lowering the frequency does not really buy any 
temperature improvement in 60 seconds, so I don't think I will need 
cpufreq anyway (other processors have a noticable jump in core 
temperature between 100%idle and a busy loop).


Jan
-- 
