From: Meelis Roos <mroos@linux.ee>
Subject: Re: [PATCH 0/3] Cpufreq frequency serialization fixes
Date: Fri, 25 Apr 2014 20:29:04 +0300 (EEST)
Message-ID: <alpine.SOC.1.00.1404252028410.11626@math.ut.ee>
References: <20140425081728.10258.63980.stgit@srivatsabhat.in.ibm.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20140425081728.10258.63980.stgit@srivatsabhat.in.ibm.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Cc: rjw@rjwysocki.net, viresh.kumar@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

> Meelis Roos reported hangs during boot in the longhaul cpufreq driver, after
> commit 12478cf0c55 (cpufreq: Make sure frequency transitions are serialized).
> The root-cause of this issue is the extra invocation of the
> cpufreq_freq_transition_begin() and cpufreq_freq_transition_end() APIs in the
> longhaul driver. I found similar issues in the powernow-k6 and powernow-k7
> drivers as well. This patchset fixes the issue in all the 3 drivers.
> 
>  Srivatsa S. Bhat (3):
>       cpufreq, powernow-k7: Fix double invocation of cpufreq_freq_transition_begin/end
>       cpufreq, powernow-k6: Fix double invocation of cpufreq_freq_transition_begin/end
>       cpufreq, longhaul: Fix double invocation of cpufreq_freq_transition_begin/end

This set fixes it for me on VIA EPIA with longhaul.

-- 
Meelis Roos (mroos@linux.ee)
