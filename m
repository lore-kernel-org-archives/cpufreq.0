From: Robos <robos@muon.de>
Subject: Re: Help regarding epox 8hda3+ mobo
Date: Sat, 12 Jun 2004 02:18:54 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040612001854.GA11954@muon.de>
References: <99F2150714F93F448942F9A9F112634C14642DE3@txexmtae.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <99F2150714F93F448942F9A9F112634C14642DE3@txexmtae.amd.com>
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
To: paul.devriendt@amd.com, cpufreq@www.linux.org.uk

On Fri, 11.06.04, paul.devriendt@amd.com wrote:

Hi Paul and List

> Attached is a clean copy of the latest driver. Place it in
> arch/i386/kernel/cpu/cpufreq ... make sure that you are
> replacing existing files.
> 
> This is version 1.20.09e

Um, in the file it says 1.00.09e, you are sure this is correct, yes?

> (Yes, it goes in i386 ... the x86_64 tree pulls it from
> there to build).
> 
> The rebuild your kerne/modules, however you have it 
> configured.
> 
> Good luck. Paul.

Thanks for the wish, but it seems that the problem persists. Still the same
error message. How can I verify that acpi also made a try and not only the
PSB table detection? Is there anything else I can try?
Cheers and thanks
Robos




-- 
Robos - 
gpg --recv-keys --keyserver blackhole.pca.dfn.de 6EEADA09
It's GNU/Linux dammit! F U M $ !
