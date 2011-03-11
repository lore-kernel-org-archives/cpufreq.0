From: Elvis Stansvik <elvstone@gmail.com>
Subject: Re: Trying to set governor results in instantaneous reboot on MSI K8N
 Master2-FAR with dual Opterons
Date: Fri, 11 Mar 2011 19:58:50 +0100
Message-ID: <AANLkTiks1pXz+jmtAVA360RwovCHPRqoFtTcVA0kbVV8@mail.gmail.com>
References: <AANLkTinyR0scJB7FPzDx6u3Q8kfM39hRuY5U_wP-C-C8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type;
        bh=jsZ1Ogsc04pLwIaYH1kFaaCBWXeQ8XmGAWomLGQqBkc=;
        b=xRCYr0+KnNS38mEUEc5rJ2Fhluw9KojD2myWBwX8Btgsn5tjAc6wt4fF2sFucvc8E2
         g0MhqA/swoznR3WkqG0kaYg7OO49XxVf1bEPGb7qvJ/HDXUKkB8d55Bz9ABc7x5Up9gJ
         hbXTIvq2ECCcpwxiK5VPn4ty9tKkeqevJfv7w=
In-Reply-To: <AANLkTinyR0scJB7FPzDx6u3Q8kfM39hRuY5U_wP-C-C8@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Nevermind everyone, I've finally figured out that this is probably a
hardware bug. My board won't support Cool'n'Quiet/PowerNow! unless I
send it to MSI for re-work. Found this bit of info in the forum
thread:

http://forum-en.msi.com/index.php?topic=90409.0

Sucks! :/

2011/3/11 Elvis Stansvik <elvstone@gmail.com>:
> Hi all,
>
> I'm trying to get CPU frequency scaling to work on an MSI K8N
> Master2-FAR motherboard running dual Opteron 252.
>
> At first, the powernow-k8 module wouldn't load saying "No such
> device", but after a BIOS upgrade from version 1.1 to version 1.42
> from MSI, the 'powernow-k8' module loaded without problems. The dmesg
> output when loading is attached as dmesg.txt.
>
> The output of `cpufreq-info' after loading the module looks fine, and
> is attached as cpufreq-info.txt
>
> I can also load the two governor modules cpufreq_conservative and
> cpufreq_ondemand without any problems.
>
> However, whenever I try to change the scaling governor to anything
> else than the default (performance), by running e.g.
>
> cpufreq-set -r -g ondemand
>
> or
>
> cpufreq-set -c 0 -g ondemand
>
> I get an immediate reboot!
>
> I've also attached my /proc/cpuinfo as cpuinfo.txt.
>
> The two Opterons are OSP252FAABL.
>
> I'm running an up-to-date Arch Linux (x64) with kernel 2.6.37.
>
> Another interesting bit is that the "Cool'n'Quiet" option that was
> present in BIOS version 1.1 disappeared when I upgraded to 1.42.
>
> I originally posted my problem on the Arch Linux Forum but was adviced
> to bring it here. My original post can be found at [1].
>
> Anyone have this board working with frequency scaling and dual CPUs?
> Would love to get it to work as I'm more interested in silence than in
> performance, and frequency scaling would allow my fans to spin down a
> bit when I'm not doing CPU intensive work.
>
> Note that my processor model isn't detected (in /proc/cpuinfo or by
> cpufreq-info). I believe this could possibly be due to BIOS not
> recognizing the model either. The OSP252FAABL is identical to the
> OSA252FAABL I think. It's just that they were only sold to system
> builders like HP and IBM. Found mine on eBay. Could the fact that the
> exact model isn't recognized by the kernel have something to do with
> my reboot problem?
>
> Thankful for any advice/help!
>
> Best regards,
> Elvis
>
> [1] https://bbs.archlinux.org/viewtopic.php?pid=902284
>
