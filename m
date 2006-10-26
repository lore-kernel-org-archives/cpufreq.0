From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Intel T2250
Date: Wed, 25 Oct 2006 22:34:05 -0400
Message-ID: <20061026023405.GE32048@dominikbrodowski.de>
References: <4536b0c818197@wp.pl> <200610190136.48254.len.brown@intel.com>
	<45372f425dbf5@wp.pl>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <45372f425dbf5@wp.pl>
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
Content-Transfer-Encoding: 7bit
To: Mateusz Mielnicki <matim@wp.pl>
Cc: cpufreq <cpufreq@lists.linux.org.uk>

On Thu, Oct 19, 2006 at 09:54:42AM +0200, Mateusz Mielnicki wrote:
> Yes, every module of cpufreq loads, acpi-cpufreq, cpufreq_powersave,
> cpufreq_conservative, freq_table and so on, excepting speedstep-centrino
> which gives "No such device".

Well, this means that speedstep is working just fine; it uses the
(preferred) acpi-cpufreq module.

	Dominik
