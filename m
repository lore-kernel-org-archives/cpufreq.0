From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH][try 4] architectural pstate driver for powernow-k8
Date: Wed, 17 Oct 2007 17:33:37 -0400
Message-ID: <20071017213337.GE9748@redhat.com>
References: <200710091446.38432.mark.langsdorf@amd.com> <20071015154031.GA30754@redhat.com> <200710151123.45582.mark.langsdorf@amd.com> <200710151603.48489.mark.langsdorf@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759963AbXJQVeN@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200710151603.48489.mark.langsdorf@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mark Langsdorf <mark.langsdorf@amd.com>
Cc: linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

On Mon, Oct 15, 2007 at 04:03:48PM -0500, Mark Langsdorf wrote:
 > This patch should apply cleanly to the 2.6.23-git7 kernel. =A0It cha=
nges the
 > powernow-k8 driver code that deals with 3rd generation Opteron, Phen=
om,
 > and later processors to match the architectural pstate driver descri=
bed
 > in the AMD64 Architecture Programmer's Manual Volume 2 Chapter 18. =A0=
The
 > initial implementation of the hardware pstate driver for PowerNow!
 > used some processor-version specific features, and would not be
 > maintainable in the long term as the processor features changed.
 > This architectural driver should work on all future AMD processors.
 > =20
 > Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>
 > Signed-off-by: Andreas Herrmann <andreas.herrmann3@amd.com>

MIME damaged, can't apply.

	Dave

--=20
http://www.codemonkey.org.uk
