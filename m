From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] cpufreq: allow ondemand governor as default
Date: Sun, 6 Mar 2005 16:51:06 -0500
Message-ID: <20050306215106.GA25034@redhat.com>
References: <20050304011359.GA32684@aquarid.physics.uwo.ca>
	<20050306170625.GA2034@isilmar.linta.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050306170625.GA2034@isilmar.linta.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk, Rob Weryk <rjweryk@uwo.ca>

On Sun, Mar 06, 2005 at 06:06:25PM +0100, Dominik Brodowski wrote:

 > This is not possible yet -- unfortunately. If you set ondemand to be
 > "default" but it fails at initialization (it does so for several drivers!),
 > cpufreq enters an undefined state

I knew there was a reason for declining this, but couldn't recall
what it was (hence I sent Rob to the list when he sent me the patch).

This has come up about 4-5 times now in the last month or two.
Maybe its worth adding a comment to the Kconfig to prevent a 6th time :-)

		Dave
