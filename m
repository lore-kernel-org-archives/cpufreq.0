From: Andi Kleen <ak@suse.de>
Subject: Re: [discuss] Re: [PATCH] Allow all Opteron processors to change
	pstate at same time
Date: Wed, 26 Jul 2006 20:53:40 +0200
Message-ID: <200607262053.40123.ak@suse.de>
References: <84EA05E2CA77634C82730353CBE3A84303218F09@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84303218F09@SAUSEXMB1.amd.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: discuss@x86-64.org
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org, "Gulam,
	Nagib" <nagib.gulam@amd.com>


> In contrast, the same machine running with TSC and standard
> PN! sees massive drift, upwards of an hour, within an hour.

Do you see the same drift when you lock date on a single CPU
with taskset?

> If the TSCnow! patch reduces measured drift down to a second 
> a week, would you consider that acceptable?

No because even one second a week will break timing badly
over time. 

I believe the only good solution unless hardware helps would
be to use per CPU TSC offsets as discussed earlier. Even that
is a bit risky because there can be still very small drifts,
but they should be limited by a clock tick error max and
might work out.

-Andi
