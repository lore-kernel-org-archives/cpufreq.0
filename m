From: Dave Jones <davej@redhat.com>
Subject: Re: [VIA][C3] bad frequencies found
Date: Mon, 14 Nov 2005 16:39:09 -0500
Message-ID: <20051114213909.GC16506@redhat.com>
References: <1132003582.7446.7.camel@linimi.narma.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1132003582.7446.7.camel@linimi.narma.net>
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
To: yves piel <yvespiel@free.fr>
Cc: cpufreq@lists.linux.org.uk

On Mon, Nov 14, 2005 at 10:26:22PM +0100, yves piel wrote:
 > 
 > So I should can scale my cpu frequency between 533Mhz and 1.2Ghz. But,
 > when I load longhaul module, the available cpu frquencies are 800000 for
 > the min, and 180000 for the max.
 > How can I tell t the longhaul driver than mys cpu can scale down to
 > 533Mhz and only up to 1.2Ghz ?

My first guess is that we've guessed the FSB incorrectly.
Can you boot with cpufreq.debug=7 and paste the extended
debug messages that end up in dmesg after loading the module ?

		Dave
