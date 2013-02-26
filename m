From: Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 1/4] ARM: shmobile: sh73a0: fix Z and ZG clock hierarchy
Date: Tue, 26 Feb 2013 14:36:24 +0900
Message-ID: <CANqRtoRjs=OxsoUQrcL6nJG-o1RpxefO3BrjBj_A2GV8HNW=qQ@mail.gmail.com>
References: <1361553474-27022-1-git-send-email-g.liakhovetski@gmx.de>
	<1361553474-27022-2-git-send-email-g.liakhovetski@gmx.de>
	<20130226042946.GB26820@verge.net.au>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=4lMLiAOIaGylWvynJnkN2CpRCZTYaK0V+Sz07yEzrz4=;
        b=WiP40ILOgs6NDyK6QV0rCgLzELUzFNU5r5Veo7bt5iRcfY3HgZlPbFDb8dEdcRQ1eh
         Ww8TSjJzcXz/VtGOpL1zeJ16NjT8ooS5Pw6hV97JDc3en2El460KVRiKcHuUyWWaptu+
         DT4fFY0q6j68VMNWG86RfVeagp02M0qUCILDT6ps2GDIF9pnsL5w3C1kJ9smvAa4s7Fp
         yl8A8lbaTQOLEdHAVXhWjBYOyJqJ8jfXWbH+tUXNmgnktJFGtJuEHZR8sE2hKTDu8BmS
         5K2kCwcwqhKuUbmnoIyB/gZYFN0FSfrnS4iYzArtnOJd4aynVfxbIVb4OWiVdByoPsoT
         kIJg==
In-Reply-To: <20130226042946.GB26820@verge.net.au>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>
Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org

On Tue, Feb 26, 2013 at 1:29 PM, Simon Horman <horms@verge.net.au> wrote:
> On Fri, Feb 22, 2013 at 06:17:51PM +0100, Guennadi Liakhovetski wrote:
>> Z and ZG clocks on sh73a0 have pll0 as their parent, not pll1.
>
> Thanks I have applied this to the soc5 branch and thus queued it up for v3.10.
> Please let me know if you would prefer me to push it as a fix for v3.9.
> And in that vein, if you regard it as -stable material.

Thanks.

Perhaps other people disagree, but I recommend not being so trigger
happy with -stable unless it will potentially give us some upside.
AFAIK there is no in-tree consumer of this clock anyway, so involving
-stable without further testing seems like a lot of hassle with no
real benefit.

Cheers,

/ magnus
