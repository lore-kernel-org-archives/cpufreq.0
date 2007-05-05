From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: cpufreq longhaul locks up
Date: Sat, 05 May 2007 06:03:06 +0200
Message-ID: <463C01FA.8070206@interia.pl>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr> 	<1178311052.6094.0.camel@localhost.localdomain> 	<Pine.LNX.4.61.0705042259160.18504@yvahk01.tjqt.qr>	<1178318978.6094.29.camel@localhost.localdomain> <Pine.LNX.4.61.0705050130090.18504@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1031729AbXEEEDX@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0705050130090.18504@yvahk01.tjqt.qr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: john stultz <johnstul@us.ibm.com>, davej@codemonkey.org.uk, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk

>>> Switching from acpi_pm+performance to acpi_pm+ondemand also
>>> locks up after a few minutes.
>> Yep. Sounds like an ondemand issue. Thanks for verifying this for me.
> 
> Nah, it also happens with cpufreq_powersave. I just need to check 
> through some archives and try booting with governor=powersave so that it 
> always stays low. 
You have a lockup when switching from other governor to powersave? Or if  
You are using it for some time?


----------------------------------------------------------------------
Wicie, rozumicie....
Zobacz >>> http://link.interia.pl/f1a74
