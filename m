From: Rainer Maier <RaMaier@gmx.de>
Subject: Re: Fehler bei cpufreq-info
Date: Tue, 02 Apr 2013 23:29:23 +0200
Message-ID: <515B4DB3.9040507@gmx.de>
References: <51558EDC.2040503@gmx.de> <3485704.XfQbseOPt4@skinner.arch.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <3485704.XfQbseOPt4@skinner.arch.suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@vger.kernel.org

Hi Thomas,
thanks for your info.
I removed cpufrequtils, but when I tried to install cpupower by aptitude it didn't know the package.
I searched for it, but couldn't find one.
Would you perhaps know which packet to install ?

Thanks
Rainer

Am 02.04.2013 10:42, schrieb Thomas Renninger:
> Hi,
>
> On Friday, March 29, 2013 01:53:48 PM Rainer Maier wrote:
>> cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
> cpufrequtils is outdated.
> Please use cpupower which is the successor.
>
>> Bitte melden Sie Fehler an cpufreq@vger.kernel.org.
>> analysiere CPU 0:
>>     Treiber: p4-clockmod
> P4-clockmod is evil and does not save much/any power.
> If you have trouble with it (lagging applications/performance), best
> blacklist p4-clockmod driver.
>
>         Thomas
>

-- 
Rainer Maier
Fabriciusstr. 46
65933 Frankfurt
T: +49 69 3904 7935
M: +49 176 3472 4262
