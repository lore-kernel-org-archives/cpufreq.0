From: Mattia Dongili <dongili@supereva.it>
Subject: Re: Cpufreq hang
Date: Wed, 16 Jul 2003 20:33:20 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030716183320.GB629@inferi.kami.home>
References: <Pine.LNX.4.53.0307161622300.30690@h192n1fls22o1048.telia.com> <20030716145325.GC632@inferi.kami.home> <Pine.LNX.4.53.0307161929430.30922@h192n1fls22o1048.telia.com>
Reply-To: dongili@supereva.it
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.53.0307161929430.30922@h192n1fls22o1048.telia.com>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

On Wed, Jul 16, 2003 at 07:53:44PM +0200, Johan Braennlund wrote:
> 
> On Wed, 16 Jul 2003, Mattia Dongili wrote:
> 
> > can you write directly to /proc/cpufreq without using the daemon?
> > eg:
> > echo "0%0%100%performance" > /proc/cpufreq
> 
> That works, but if I substitute "powersave" for "performance" the system
> hangs. In fact, I tried various changes in the above and anything with
> "performance" works and anything with "powersave" hangs. The kernel I'm
> using is 2.5.74-mm1, but I've seen cpufreqd hang on other recent 2.5
> kernels as well, so I imagine the situation would be the same there.

so it's most probably a driver issue, anybody from the gurus?

-- 
mattia
:wq!
