From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [ANNOUNCE] cpupowerutils - cpufrequtils extended with quite some features
Date: Sat, 12 Mar 2011 10:59:10 +0100
Message-ID: <AANLkTinErtKD_eufvhOL-1OOffYSouf5KLLH2cCMyaT3@mail.gmail.com>
References: <201103111247.00212.trenn@suse.de>
	<AANLkTimFg+uYGbSi=Ci-+_e89TgLkyMB7PAJcnt7mzTc@mail.gmail.com>
	<201103120053.53565.trenn@suse.de>
Mime-Version: 1.0
Return-path: <platform-driver-x86-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=/njf7p+yg+15yAMMFRLr2N3Yqh7Foa0ZEcAozXXIJQU=;
        b=YdtKc/akH237hY0kA+oM19GwXTTJ1D92qID1RYcYm+ipCazaSPAUIZ2+oXs6lIuw//
         2se85tPrqKME/xQVvvxnPdATPNkKPAU4bdeBAJ2dyO7dE4XjiLQEv2nv+svcmJ7hA9AR
         g1zsWXna5yEYrMqfQCNu5Z0F3TUkiQnyyHxVQ=
In-Reply-To: <201103120053.53565.trenn@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: linux-pm@lists.linux-foundation.org, discuss@lesswatts.org, cpufreq@vger.kernel.org, platform-driver-x86@vger.kernel.org

>> Hi Thomas,
>> Do you think handling really vendor specific "boosts" like EeePC's SHE
>> is in cpupower scope
> This is an oem/vendor specific way to modify the front-side-bus
> throughput on (Intel atom only?) eeepc like machines (acer, asus and
> others?)?

I don't know exactly what it does, but yes it seems to modify the fsb
(and possibly something else on some models, who know ...), and it's
only specific to Asus EeePCs.
But Asus notebooks seems to have a similar "Power4Gear" function, that
may also overclock/downclock the gpu.

> You could try to experiment with registering your own delayed work queue
> in eeepc-laptopc.c and try to find best tunings and fittings for such
> requirements.
> If it works out and/or other xy-laptop.c or whatever drivers provide
> similar functionality it could get moved up into a more generic
> framework. A separate one next to cpuidle and cpufreq, for example
> fsb_mod?

I'll see if other platform drivers have something similar, but I
believe that at least one of them has a "peformance" mode.

> PS: Wouldn't the cpufreq subsystem suffice to register for this
> SHE thing?
> Could it be that SHE and real CPU freq (speedstep) is mutual exclusive?
> Is the only problem that p4_clockmod cannot be loaded then?

p4_clockmod is only loaded on olds EeePCs. New ones are using
acpi-cpufreq. And you can only load one cpufreq driver at a time.


-- 
Corentin Chary
http://xf.iksaif.net
