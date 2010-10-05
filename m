From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: cpupowerutils: easier use of msr and cpuid stuff and some more
Date: Tue, 5 Oct 2010 16:15:32 +0200
Message-ID: <20101005141532.GA10182@comet.dominikbrodowski.net>
References: <1286281394-14699-1-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1286281394-14699-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@vger.kernel.org

Applied, thanks Thomas.

A few comments:
- cpuid.h probably should be split up into a ".h" and a ".c" part
- Compiling msr.c:                                                     =
 [OK]    =20
	  lib/msr.c:80: warning: =E2=80=98write_msr=E2=80=99 defined but not u=
sed
- instead of adding two options to cpufreq-info doing the same,
  I only added one (--boost / -b)=20

Best,
	Dominik

