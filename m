From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Move of powerpc/cell cpufreq drivers
Date: Sat, 29 Mar 2014 10:54:13 +0530
Message-ID: <CAKohponLbK3aTBHMk2RWEzLwOyiLV5uvWKbz6uoWJ79BfoBfXg@mail.gmail.com>
References: <20140328102616.20b45a0a@endymion.delvare>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20140328102616.20b45a0a@endymion.delvare>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <jdelvare@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On 28 March 2014 14:56, Jean Delvare <jdelvare@suse.de> wrote:
> the cbe_cpufreq_pmi and cbe-cpufreq drivers were moved and renamed,
> together with their respective Kconfig symbols. In the move,
> tristate CBE_CPUFREQ_PMI became bool CPU_FREQ_CBE_PMI. This makes it
> impossible to build the ppc_cbe_cpufreq_pmi driver as a module, while
> that was possible before the move.
>
> I see nothing in the commit message that would suggest that this change
> was intentional. Instead I suspect this is a mistake and
> CPU_FREQ_CBE_PMI was actually supposed to be a tristate.

Yes, that was a mistake and it happened because I removed
CBE_CPUFREQ_PMI_ENABLE completely and reused its definition for
CBE_CPUFREQ_PMI and didn't notice the bool things :(
