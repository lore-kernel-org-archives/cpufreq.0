From: Mattia Dongili <dongili@supereva.it>
Subject: Re: cpufreqd + acpi - error message
Date: Tue, 18 May 2004 10:35:19 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040518083519.GA1977@inferi.kami.home>
References: <99F2150714F93F448942F9A9F112634C1365B7FA@txexmtae.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <99F2150714F93F448942F9A9F112634C1365B7FA@txexmtae.amd.com>
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
To: paul.devriendt@amd.com
Cc: mark.langsdorf@amd.com, mailonde@gmx.net, cpufreq@www.linux.org.uk

On Mon, May 17, 2004 at 06:55:52PM -0500, paul.devriendt@amd.com wrote:
> I ran into this. libsys_init() in libsys_acpi.c gets upset if
> the number of batteries is less than 0. The number of batteries
> being returned is -1. I got it working by just hardcoding the
> number of batteries to 0 instead, and it seemed happy with that
> (my machine does not even support batteries, it is a 4P server).
> 
> I have not reported it to the maintainers yet, as I am not
> really sure which code is at fault. It is on my list to look
> at further and try to decide what ought to be happening here.
> The -1 return comes from a scandir() call.

I'm sorry, cpufreqd is/was mainly aimed at laptop usage, that's why I
expect to find something in /proc/acpi/battery/

I'm now working to make cpufreqd useable on every machine where
batteries and ac plug have no sense.

In the meantime your hack is the only possible solution.

bye
-- 
mattia
:wq!
