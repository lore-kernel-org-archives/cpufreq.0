From: Mattia Dongili <dongili@supereva.it>
Subject: Re: [PATCH] Driver to export CPUfreq statistic
Date: Mon, 22 Nov 2004 20:02:40 +0100
Message-ID: <20041122190240.GE3001@inferi.kami.home>
References: <88056F38E9E48644A0F562A38C64FB6003662062@scsmsx403.amr.corp.intel.com>
	<20041122162230.GA8971@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041122162230.GA8971@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

On Mon, Nov 22, 2004 at 05:22:31PM +0100, Dominik Brodowski wrote:
> On Sun, Nov 21, 2004 at 03:15:33PM -0800, Pallipadi, Venkatesh wrote:
> > I feel this should not be depending on CPU_FREQ debug. Then we can have
> > some utility in cpufreq-utils which can display 'top' like output.
> 
> Sounds fair to me. Dave?
> 
> Oh, and who does volunteer for that 'top'-like utility?

I'm trying to find some time to test the patch and write a cpufreqd rule
based on cpufreqd stats (usefull?? who knows...[1]), so if I'll come
there first there will be at least some code to start from (if not
_I_'ll have some code to start from :-) )

[1]: I also don't care (apathy!) :) I'm implementing the most fancy
rules like frequency switching based on dates (yes, calendar dates, I
can't put my P4 at full speed during the whole august...)
-- 
mattia
:wq!
