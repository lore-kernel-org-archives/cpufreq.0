From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Problems on Dell D800 with Dothan 1.8
Date: Wed, 28 Jul 2004 19:06:44 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040728170644.GA8678@dominikbrodowski.de>
References: <BAY15-F17EI5WzJ7D9t0002075c@hotmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <BAY15-F17EI5WzJ7D9t0002075c@hotmail.com>
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
To: ". ." <matheng10@hotmail.com>
Cc: cpufreq@www.linux.org.uk

On Wed, Jul 28, 2004 at 04:06:14PM +0000, . . wrote:
Please state your name in messages to this list -- it's more friendly.

Support for the Dothan stepping in your notebook is already in cpufreq's
BitKeeper repository, but hasn't yet found its way to Linus' tree -- so it's
not yet available in kernel 2.6.7.

If using the patch generated out of cpufreq's BitKeeper
repository, available at:
http://www.codemonkey.org.uk/projects/bitkeeper/cpufreq/cpufreq-2004-07-28.diff
speedstep-centrino should work for your notebook. This patch might not apply
cleanly to 2.6.7, so I recommend using the latest Linus' "bk" snapshot; the
one patch failure I've been seeing just now when doing so doesn't matter (0
vs. NULL, for those interested...)

	Dominik
