From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Processor speed way above specs
Date: Sun, 12 Dec 2004 10:28:23 +0100
Message-ID: <20041212092823.GB9142@dominikbrodowski.de>
References: <200412102342.58060.hilbert.mostert@tadis.nl>
	<200412102342.58060.hilbert.mostert@tadis.nl>
	<200412110019.04763.hilbert.mostert@tadis.nl>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200412102342.58060.hilbert.mostert@tadis.nl>
	<200412110019.04763.hilbert.mostert@tadis.nl>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hilbert Mostert <hilbert.mostert@tadis.nl>
Cc: cpufreq@www.linux.org.uk

Hi,

Can you post the output of "/proc/acpi/processor/*/performance", please?
Also, which is the driver you're using at the moment
("/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver")?

	Dominik
