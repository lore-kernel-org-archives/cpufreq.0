From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: Suspend to RAM regression tracked down
Date: Sun, 02 Jul 2006 23:02:36 -0700
Message-ID: <44A8B2FC.6080806@goop.org>
References: <1151837268.5358.10.camel@idefix.homelinux.org>	<44A80B20.1090702@goop.org>
	<1151880764.5358.32.camel@idefix.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1151880764.5358.32.camel@idefix.homelinux.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jean-Marc Valin <Jean-Marc.Valin@USherbrooke.ca>
Cc: cpufreq@lists.linux.org.uk, Linux Kernel <linux-kernel@vger.kernel.org>

Jean-Marc Valin wrote:
> Any link to the patch and the thread about the problem (if any)? Also,
> was the race introduced in 2.6.12-rc5-git6? If not, it's a completely
> different problem because my machine worked fine with 2.6.12-rc5-git5.
>   

It's in the thread on the cpufreq list titled "ondemand vs suspend"; 
Venkatesh Pallipadi posted the patch.

    J
