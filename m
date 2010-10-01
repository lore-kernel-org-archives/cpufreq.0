From: Dave Jones <davej@redhat.com>
Subject: Re: [RESEND PATCH] cpufreq: unnecesary double free in
 pcc_cpufreq_do_osc
Date: Fri, 1 Oct 2010 01:25:41 -0400
Message-ID: <20101001052540.GA31519@redhat.com>
References: <1285875804.2180.1.camel@cowboy>
 <AANLkTikbSYutRGwQLU2srEQG6CO7pvXdFBQ0W216DoCv@mail.gmail.com>
 <20100930200617.GA4120@redhat.com>
 <4CA567DB.4000208@kernel.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4CA567DB.4000208@kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pekka Enberg <penberg@kernel.org>
Cc: dave@gnu.org, cpufreq@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86 maintainers <x86@kernel.org>

On Fri, Oct 01, 2010 at 07:47:23AM +0300, Pekka Enberg wrote:

 > > I think Dave's patch is correct.  There's a kfree(output.pointer) at line 359.
 > > If we fall all the way through without hitting any of the return -ENODEVs,
 > > we end up doing a 2nd kfree in the out_free:
 > 
 > There's a second call to acpi_evaluate_object() which takes "output" as 
 > its argument and allocates more memory.

yup. I merged your patch. after it's soaked in -next for a day, I'll push it to
Linus.  (Looks obviously correct, but just being extra careful given where
we are in the release cycle)

	Dave

