From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: governor implementations
Date: Sat, 1 May 2004 20:23:59 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040501182359.GE578@poupinou.org>
References: <E1BJM2v-0001tP-Nf@www.linux.org.uk>
	<Pine.LNX.4.44.0404292040380.1552-100000@cat.eecg.toronto.edu>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0404292040380.1552-100000@cat.eecg.toronto.edu>
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
To: David Tam <tamda@eecg.toronto.edu>
Cc: wtsang@dgp.toronto.edu, cpufreq@www.linux.org.uk, Catalin Drula <catalin@cs.toronto.edu>

On Thu, Apr 29, 2004 at 09:46:40PM -0400, David Tam wrote:
> Hi.
> 
> We did some work along these lines for a grad course project in Dec 2003.
> It was done using a development version of Linux kernel 2.6.
> Unfortunately, we haven't had time to keep it up to date.
> Hopefully, it only requires minor updates.
> 
> Here is a link to the web page.  You can check out our presentation slides,
> final report, and other docs.
> http://www.eecg.toronto.edu/~tamda/csc2228/

BTW, do you want to update them (even though you think you don't have
time for) in your sparse time?
NB: floating arithmetics shall be avoided in kernel land.  It's
probably the main issue in your(s) governor(s).

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
