From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: userspace not supported for longrun?
Date: Tue, 1 Jun 2004 11:31:10 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040601093110.GE7926@poupinou.org>
References: <6BE4F22C-B37D-11D8-B4AF-003065EE23A0@connact.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <6BE4F22C-B37D-11D8-B4AF-003065EE23A0@connact.com>
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
To: Wayne Wylupski <wayne@connact.com>
Cc: cpufreq@www.linux.org.uk

On Mon, May 31, 2004 at 11:40:26PM -0400, Wayne Wylupski wrote:
> Hello,
> 
> I've been tracking down an issue with using Fedora Core 2 on a 
> Transmeta Crusoe TM5800 and it appears a userspace governor is not 
> supported by cpufreq (the longrun scaling driver has a .setpolicy, 
> which prevents the userspace governor from being set).
> 
> Could someone please explain if this is by choice or a bug?  If it's 
> the latter, could someone explain why, since the CPU itself supports 
> different frequencies?
> 

It's by choice.  Even though there exist some algo. for which it's seems
there are better choice over the longrun facilities in order to switch
automatically the frequency of the processor, it's hard to get those
algo. to mainline mostly due to some kind of patent issues
apparently.  So for now the longrun driver do not have the facilities to
make what you request.  Would be fine perhaps to add that, but I'm
not sure it's in a high priority item for now.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
