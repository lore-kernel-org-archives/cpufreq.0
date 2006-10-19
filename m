From: Wes Felter <wesley@felter.org>
Subject: Re: 3.2GHz cpus with cpufreq become 2.8GHz
Date: Thu, 19 Oct 2006 11:19:14 -0500
Message-ID: <4537A582.4020406@felter.org>
References: <Pine.LNX.4.64.0610182133130.29935@bizon.gios.gov.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <Pine.LNX.4.64.0610182133130.29935@bizon.gios.gov.pl>
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
To: cpufreq@lists.linux.org.uk

Krzysztof Oledzki wrote:
> Hello,
> 
> I have just noticed that enabling cpufreq on my Dell PowerEdge 1425SC 
> changes my secondary cpu clock to 2.8GHz.

[snip]

> # cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver
> p4-clockmod

You shouldn't be using this driver. Use speedstep-centrino or acpi-cpufrreq.

Wes Felter - wesley@felter.org
