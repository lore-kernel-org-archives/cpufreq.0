From: Arjan van de Ven <arjanv@redhat.com>
Subject: Re: [PATCH]: speedstep-lib: fix frequency multiplier for Pentium4
	models 0&1
Date: Sat, 22 Jan 2005 15:23:53 +0100
Message-ID: <20050122142353.GB19194@devserv.devel.redhat.com>
References: <41F259C4.9020903@tiscali.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@zenII.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <41F259C4.9020903@tiscali.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias-Christian Ott <matthias.christian@tiscali.de>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq@zenII.linux.org.uk, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@osdl.org>, "H. Peter Anvin" <hpa@zytor.com>, Zwane Mwaikambo <zwane@commfireservices.com>, Dominik Brodowski <linux@brodo.de>


On Sat, Jan 22, 2005 at 02:48:52PM +0100, Matthias-Christian Ott wrote:
> The Pentium4 models 0&1 have a longer MSR_EBC_FREQUENCY_ID register as 
> the models 2&3, so the bit shift must be bigger.

I would feel safer if this checked that it was actually a p4 as well...
