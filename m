From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [RFC] cpufreqtools
Date: Fri, 22 Oct 2004 16:39:27 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041022143927.GE22405@poupinou.org>
References: <20041021172227.GA24663@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041021172227.GA24663@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk
Cc: jeremy@goop.org

On Thu, Oct 21, 2004 at 07:22:27PM +0200, Dominik Brodowski wrote:
> Hi all,
> 
> The multitude of cpufreq userspace tools is something I like very much: it
> offers the user the choice to use the tools which suits her needs best.
> 
> However, there are three issues which should be addressed, in my humble
> opinion:
> 
> A) A small tool which allows to modify cpufreq settings without having to
> type e.g. "/sys/devices/system/cpu/cpu0/cpufreq/scaling_set_speed" all the
> time.
> 
> B) A small tool which prints out cpufreq information helpful to developers
> and interested users.
> 
> C) A library, used by A), B) and any other cpufreq userspace tool
> that wants to do so, which allows for a unified code base on how to
> determine current cpufreq settings and how to modify or change them.


I think that Jeremy's work being somehow integrated into your utilities.
I think libspeedfreq.c is a good starting point for point C at least.

(reminder: http://www.goop.org/~jeremy/speedfreq/)

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
