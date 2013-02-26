From: Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH/RFC v2 0/2] CPUFreq for kzm9g
Date: Tue, 26 Feb 2013 21:08:14 +0900
Message-ID: <CANqRtoSpu3V5KC-POq7+y0NpRx6yNfdZFfgaxa7Lv1gU1rO53Q@mail.gmail.com>
References: <Pine.LNX.4.64.1302251644010.3030@axis700.grange>
Mime-Version: 1.0
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=vQv2ytB8k6YL6/GedTc8t/hEYReNj9sb8ckkQwWaDaI=;
        b=kiN0/iEq8CS9z/EDxYZaymjDooeBD78YIARCROb+KQ0msk1riCYcOLZF/aAACl/MvY
         oZpN5IHxU4ea50En6CDh80fgtFSZVp7lQQUBm7z2nazpHjUTN7PSOtm552fyS1oet14h
         WySUFMM1EKZ3JITNTxAPl2cqdsZThjEUZZ3AFl0HZTlUgArTgr+cUIiQIakk5zRvPQNw
         B7+Mndkh4Z+d4YH1xIIncg45Sb1iJseCo6Apivb+yAhr03n5R3KJYSpQ9opsw7m4ddcf
         bxq90/g+HzouxhuKiL4fLtJB8KwcM2PPSILntxHrCRPhtBD4IWGvCl3Eb3VDFvc/nymv
         vuqQ==
In-Reply-To: <Pine.LNX.4.64.1302251644010.3030@axis700.grange>
Sender: linux-sh-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: linux-sh@vger.kernel.org, Simon Horman <horms@verge.net.au>, linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org

On Tue, Feb 26, 2013 at 2:16 AM, Guennadi Liakhovetski
<g.liakhovetski@gmx.de> wrote:
> In v2 of this patch-set I dropped patches 1 and 3, because #1 is a bug-fix
> and can go in separately, #3 is more of a debugging help, than a real
> patch for mainlining. Of the remaining 2 patches the main difference to v1
> is the omission of the PLL0 manipulation. More is explained in respective
> patches.
>
> Guennadi Liakhovetski (2):
>   ARM: shmobile: sh73a0: add support for adjusting CPU frequency
>   ARM: shmobile: kzm9g-reference: add CPUFreq support

Hi Guennadi,

Thanks for your work on this. In general I am quite happy about this series.

One rather significant question is however this: Would it be possible
for you to check if the TWD is operating as expected when you scale
the CPU Frequency? I suspect it is not, so please cook up a v3 of this
series that also includes updates for timers.

Cheers,

/ magnus
