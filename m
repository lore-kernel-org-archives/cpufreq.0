From: Mike Galbraith <efault@gmx.de>
Subject: RE: p4_clockmod broken in 2.6.16-rc? kernels
Date: Fri, 10 Mar 2006 04:25:45 +0100
Message-ID: <1141961145.7807.11.camel@homer>
References: <88056F38E9E48644A0F562A38C64FB60077AFDA6@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60077AFDA6@scsmsx403.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk, davej@codemonkey.org.uk

On Thu, 2006-03-09 at 05:53 -0800, Pallipadi, Venkatesh wrote:
> Please try the attached patch and let me know whether that helps.

Sorry for the late response.  I'm the father of an 18 year old chip off
the old block-head... 'nuff said.

Yes, this fixes it for both SMP and UP.  Thanks for the quick response.

	-Mike

(Now to go patch my kernel. 2250 Mhz my south 40.. buy cpu for $$ get
bonus defects for free.. mutter mutter gripe bitch whine complain;) 
