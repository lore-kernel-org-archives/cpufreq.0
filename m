From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: little system-hang when switching frequencies
Date: Thu, 10 Jun 2004 10:13:37 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040610081337.GA7723@dominikbrodowski.de>
References: <1086717641.4311.30.camel@localhost>
	<20040609155946.GB9482@dominikbrodowski.de>
	<1086816407.2756.10.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1086816407.2756.10.camel@localhost>
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
To: Thomas Breitner <mail@tombreit.de>
Cc: cpufreq@www.linux.org.uk

On Wed, Jun 09, 2004 at 11:26:47PM +0200, Thomas Breitner wrote:
> i don't understand the meaning of result "0", but it seems that the
> system needs *only* one - the first - try to switch from low to high
> frequency - but it needs always 6 retries to switch back.

Result "0" means there's no postive or negative return value in =D; but the
"state" (=b) [ebx?] is still at the old state... 

> but: switching frequencies under the preinstalled win xp works "in both
> directions". how is this possible when it's the bios which is causing
> the "little system hang"?

Hm, have you tried the ACPI P-States cpufreq driver? Also, it might be that
win xp knows more about speedstep-smi than we do, as Intel didn't release
any specification on speedstep-smi...

	Dominik
