From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 1/1] Speedfreq-SMI call clobbers ECX
Date: Thu, 6 Mar 2008 11:56:03 +0100
Message-ID: <20080306105603.GL13391@elte.hu>
References: <200803051559.09962.langer_mann@web.de>
	<20080305153520.GB19300@elte.hu>
	<200803060938.20944.langer_mann@web.de>
	<200803060951.12002.langer_mann@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200803060951.12002.langer_mann@web.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: Stephan Diestelhorst <langer_mann@web.de>
Cc: davej@codemonkey.org.uk, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk


* Stephan Diestelhorst <langer_mann@web.de> wrote:

> Again, should I provide these patches? This thing just annoyed me for 
> a while as I have been patching it in my personal kernels for too 
> long.

yes, please do keep sending them (and any other patches you might have) 
- it's a real issue on real hardware so we want this fix upstream.

	Ingo
