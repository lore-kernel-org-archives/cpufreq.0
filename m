From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH] Eliminate cpufreq_userspace scaling_setspeed deadlock
Date: Wed, 7 Nov 2007 21:56:39 +0900
Message-ID: <20071107125638.GB27092@inferi.kami.home>
References: <20071026171821.GA20924@linux-os.sc.intel.com>
	<08DF4D958216244799FC84F3514D70F0B5555C@pdsmsx415.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <08DF4D958216244799FC84F3514D70F0B5555C@pdsmsx415.ccr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: "Yu, Luming" <luming.yu@intel.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq <cpufreq@www.linux.org.uk>, "Yu,
	Fenghua" <fenghua.yu@intel.com>

On Mon, Nov 05, 2007 at 04:58:18PM +0800, Yu, Luming wrote:
> Based on my current testing results, this patch fixes my problem.
> Please help push it upstream.

BTW, this will break some userspace apps. I can think of cpufrequtils
and some deamons that use the userspace governor to set frequencies.

-- 
mattia
:wq!
