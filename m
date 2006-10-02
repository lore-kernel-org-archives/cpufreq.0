From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 6/8]cpufreq: acpi-cpufreq: Eliminate get of current freq
	on notification
Date: Mon, 2 Oct 2006 02:51:43 +0200
Message-ID: <20061002005143.GD17412@isilmar.linta.de>
References: <20061001071545.F16392@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061001071545.F16392@unix-os.sc.intel.com>
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
To: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Cc: alexey.y.starikovskiy@intel.com, Dave Jones <davej@redhat.com>, cpufreq <cpufreq@www.linux.org.uk>

Hi,

On Sun, Oct 01, 2006 at 07:15:45AM -0700, Venkatesh Pallipadi wrote:
> Only change the frequency if the state previously set is different
> from what we are trying to set. We don't really have to get the current
> frequency at this point.

What if it changed behind our back? Shouldn't happen, I know, but it does
happen.

	Dominik
