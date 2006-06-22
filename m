From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [RFC] sysdev_driver / cpufreq notification locking design issue.
Date: Thu, 22 Jun 2006 21:20:25 +0200
Message-ID: <20060622192025.GB11313@dominikbrodowski.de>
References: <5389061B65D50446B1783B97DFDB392D015E5A3A@orsmsx411.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <5389061B65D50446B1783B97DFDB392D015E5A3A@orsmsx411.amr.corp.intel.com>
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
To: "Gross, Mark" <mark.gross@intel.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Tue, Jun 13, 2006 at 09:57:53AM -0700, Gross, Mark wrote:
> It seems that the attributes exposed by the system device could be move
> somewhere else in the sysfs hierarchy easily enough.  I'm thinking under
> /sys/devices/platform/cpufreq should be an ok place to put the
> cpufreq-attributes.

Yes, though we'd need to add a symlink for backwards compatibility unless we
want to break every working cpufreq setup out there ;)

Thanks,
	Dominik
