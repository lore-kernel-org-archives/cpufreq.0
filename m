From: Dave Jones <davej@redhat.com>
Subject: Re: [RESEND PATCH] cpufreq: unnecesary double free in
 pcc_cpufreq_do_osc
Date: Thu, 30 Sep 2010 16:06:17 -0400
Message-ID: <20100930200617.GA4120@redhat.com>
References: <1285875804.2180.1.camel@cowboy>
 <AANLkTikbSYutRGwQLU2srEQG6CO7pvXdFBQ0W216DoCv@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTikbSYutRGwQLU2srEQG6CO7pvXdFBQ0W216DoCv@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pekka Enberg <penberg@kernel.org>
Cc: dave@gnu.org, cpufreq@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86 maintainers <x86@kernel.org>

On Thu, Sep 30, 2010 at 10:59:51PM +0300, Pekka Enberg wrote:
 > > +++ b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
 > > @@ -379,6 +379,8 @@ static int __init pcc_cpufreq_do_osc(acpi_hand=
le *handle)
 > > =A0 =A0 =A0 =A0if (!(supported & 0x1))
 > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENODEV;
 > >
 > > + =A0 =A0 =A0 return ret;
 > > +
 > > =A0out_free:
 > > =A0 =A0 =A0 =A0kfree(output.pointer);
 > > =A0 =A0 =A0 =A0return ret;
 >=20
 > Where is the double free here? I can't see it. I do see memory leaks
 > happening in error handling paths of pcc_cpufreq_do_osc() which make=
s
 > me think we need something like the attached patch.

I think Dave's patch is correct.  There's a kfree(output.pointer) at li=
ne 359.
If we fall all the way through without hitting any of the return -ENODE=
Vs,
we end up doing a 2nd kfree in the out_free:

	Dave

