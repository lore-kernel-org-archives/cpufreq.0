From: David Tam <tamda@eecg.toronto.edu>
Subject: Re: governor implementations
Date: Mon, 3 May 2004 10:15:55 -0400 (EDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.44.0405031010540.1552-100000@cat.eecg.toronto.edu>
References: <20040501182359.GE578@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040501182359.GE578@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: wtsang@dgp.toronto.edu, cpufreq@www.linux.org.uk, Catalin Drula <catalin@cs.toronto.edu>

Hi.
Yes, I guess we should spent a few hours to update them and "massage"
them into a standard Linux kernel patch & loadable kernel module package.
Yes, we've been told in the past that floating point arithmetic is bad in
the kernel.  Thanks for the reminder.

On Sat, 1 May 2004, Bruno Ducrot wrote:
> On Thu, Apr 29, 2004 at 09:46:40PM -0400, David Tam wrote:
> > We did some work along these lines for a grad course project in Dec 2003.
> > It was done using a development version of Linux kernel 2.6.
> > Unfortunately, we haven't had time to keep it up to date.
> > Hopefully, it only requires minor updates.
> > 
> > Here is a link to the web page.  You can check out our presentation slides,
> > final report, and other docs.
> > http://www.eecg.toronto.edu/~tamda/csc2228/
> 
> BTW, do you want to update them (even though you think you don't have
> time for) in your sparse time?
> NB: floating arithmetics shall be avoided in kernel land.  It's
> probably the main issue in your(s) governor(s).

-- 
David Tam <tamda@eecg.toronto.edu>
Graduate Student, ECE Dept, University of Toronto
http://www.eecg.toronto.edu/~tamda
