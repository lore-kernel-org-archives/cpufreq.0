From: Thomas Renninger <trenn@suse.de>
Subject: Re: cpupowerutils: easier use of msr and cpuid stuff and some more
Date: Tue, 5 Oct 2010 16:37:57 +0200
Message-ID: <201010051637.58138.trenn@suse.de>
References: <1286281394-14699-1-git-send-email-trenn@suse.de> <20101005141532.GA10182@comet.dominikbrodowski.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20101005141532.GA10182@comet.dominikbrodowski.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="utf-8"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@vger.kernel.org

On Tuesday 05 October 2010 16:15:32 Dominik Brodowski wrote:
> Applied, thanks Thomas.
>=20
> A few comments:
> - cpuid.h probably should be split up into a ".h" and a ".c" part
Yep, I agree.

> - Compiling msr.c:                                                   =
   [OK]    =20
> 	  lib/msr.c:80: warning: =E2=80=98write_msr=E2=80=99 defined but not=
 used
Hm, I think I would comment it out for now instead of deleting.
It will probably be needed soon.

> - instead of adding two options to cpufreq-info doing the same,
>   I only added one (--boost / -b)=20
I agree.

I can send updates if you pushed them in.
That would be easier for me, instead of reworking/reposting.
On sever bugs/build failures, etc., I will of course repost.

Thanks,

   Thomas
