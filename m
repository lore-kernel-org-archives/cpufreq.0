From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Help: Using cpufreq from kernel level
Date: Sat, 17 Dec 2005 21:58:11 +0100
Message-ID: <20051217205811.GA12598@isilmar.linta.de>
References: <200512171310.34014.cloud.of.andor@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200512171310.34014.cloud.of.andor@gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Claudio Scordino <cloud.of.andor@gmail.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Sat, Dec 17, 2005 at 01:10:33PM -0500, Claudio Scordino wrote:
> At user level it can be done through
> 
> /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies

Only on _some_ CPUs, and therefore it isn't part of the information
available to governors.

	Dominik

PS: Please use only the cpufreq mailing list for cpufreq-related questions 
in future
