From: Borislav Petkov <bp@amd64.org>
Subject: Re: [PATCH 2/5] acpi-cpufreq: Add support for disabling dynamic
 overclocking
Date: Tue, 2 Aug 2011 22:50:44 +0200
Message-ID: <20110802205044.GA21330@aftab>
References: <1305651819-25660-1-git-send-email-mjg@redhat.com>
 <1305651819-25660-2-git-send-email-mjg@redhat.com>
 <alpine.LFD.2.02.1108021618190.25237@x980>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.02.1108021618190.25237@x980>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Brown <lenb@kernel.org>
Cc: Matthew Garrett <mjg@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "davej@redhat.com" <davej@redhat.com>, "Langsdorf, Mark" <mark.langsdorf@amd.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On Tue, Aug 02, 2011 at 04:21:16PM -0400, Len Brown wrote:
> While this patch will work and is not invalid, I don't like it.
> 
> It advertises a user I/F that suggests that disabling turbo
> is on a per logical processor basis -- but a write to
> any of the attributes will write to every CPU in the system.
> 
> Either it should do per-cpu limiting (which, btw doesn't
> work if you use the MISC_ENABLES MSR method in this patch,
> and would instead need to use the PERF_CTL.32 method)
> or there should be a per-system attribute
> that reflects that this knob is per-system.

Agreed with the per-system thing. The reason to disable boosting on
all cores is very simple: nobody has come up with a usecase until now
which needs disabling only a subset of the cores. Also, this way the
implementation is the simplest.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
GM: Alberto Bozzo
Reg: Dornach, Landkreis Muenchen
HRB Nr. 43632 WEEE Registernr: 129 19551
