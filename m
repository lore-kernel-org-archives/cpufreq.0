From: Harald Milz <milz@seneca.muc.de>
Subject: Re: Manual PST settings for "unrecognized CPUs"
Date: Thu, 19 Aug 2004 02:16:54 +0200 (CEST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040819001654.32D0D4BE98@nathan.muc.de>
References: <39e3484804081616133c2765ce@mail.gmail.com>
	<20040817062634.6C2404BE94@nathan.muc.de>
	<39e348480408171130537c34e6@mail.gmail.com>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

GoatZilla <goatzilla@gmail.com> wrote:
> Ah, I just found your patch back in June; looks like good stuff.  I'll
> give it a try when I get Linux onto my machine.

Please give me some feedback as to the usability etc. Further patches, etc. 

> It's odd that you couldn't get below 9x on the multipliers.  With

I suspect it's the Vcore - although I admit it sounds strange. But I can
see no other reason. My Asus A7V8X can't go below 1.5V nominal so I can't
test it for now without modding my board for undervoltage. I'd appreciate
hearing from folks who have boards that can go further down. The URL in the
patch can give a clue which VID corresponds to FID=533M or something. 

> As far as the max FID is concerned, you've probably figured it out by
> now, but the max FID that can be set by software is controlled by the
> L6 bridges on the CPU package.

Yup... for those willing to put their machine on risk,
http://fab51.com/index-e.html is an excellent source of information. 

After all, this is quite useful even for servers that run idle most of
the time and need sheer CPU power only occassionally, like LinVDR servers
(which is exactly what I intend to do).

-- 
Accuracy, n.:
	The vice of being right
