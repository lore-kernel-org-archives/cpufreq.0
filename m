From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: post-OLS pending cpufreq patches
Date: Tue, 3 Aug 2004 14:42:23 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040803124223.GB8574@dominikbrodowski.de>
References: <88056F38E9E48644A0F562A38C64FB600283BD34@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB600283BD34@scsmsx403.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk

On Mon, Aug 02, 2004 at 03:45:14PM -0700, Pallipadi, Venkatesh wrote:
> This patch was completely missing in 2004-08-02.diff. 
> And it needed some rework too. Here is the updated incremental patch.

Could you send the diff to include/acpi/processor.h as well, please, else
the build will fail.

Thanks,
	Dominik
