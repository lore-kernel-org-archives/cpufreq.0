From: Dave Jones <davej@redhat.com>
Subject: Re: powernow-k8: support acpi
Date: Tue, 6 Apr 2004 18:05:06 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040406170506.GG6930@redhat.com>
References: <20040321185417.GA7969@dominikbrodowski.de>
	<20040326122931.GA321@elf.ucw.cz>
	<20040401235635.GA25744@redhat.com>
	<20040402162447.GP19001@poupinou.org>
	<20040402163902.GC5688@redhat.com>
	<20040402170926.GA289@elf.ucw.cz>
	<20040406130730.GA5133@redhat.com>
	<20040406145502.GA7307@dominikbrodowski.de>
	<20040406154750.GE6930@redhat.com>
	<20040406165539.GA7376@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040406165539.GA7376@dominikbrodowski.de>
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
To: Pavel Machek <pavel@ucw.cz>, Andrew Morton <akpm@osdl.org>, Bruno Ducrot <ducrot@poupinou.org>, mark.langsdorf@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>, paul.devriendt@amd.com

On Tue, Apr 06, 2004 at 06:55:39PM +0200, Dominik Brodowski wrote:
 > > True, it's a sledgehammer to crack a walnut, but I'm not sure messing with
 > > weak symbols would be any cleaner,
 > What do you mean with "weak symbols"?

see for example how cond_syscall is implemented.

		Dave
