From: Harald Milz <milz@seneca.muc.de>
Subject: Re: Manual PST settings for "unrecognized CPUs"
Date: Thu, 19 Aug 2004 02:05:23 +0200 (CEST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040819000523.7C4CA4BE98@nathan.muc.de>
References: <39e3484804081616133c2765ce@mail.gmail.com>
	<20040817062634.6C2404BE94@nathan.muc.de>
	<20040817080826.GC29560@poupinou.org>
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

Bruno Ducrot <ducrot@poupinou.org> wrote:
> Mine is a little bit too old btw, and I guess yours should be used
> instead for now..

Well I'm using it right now on a SUSE 9.1 2.6.5-7.104-default
kernel, together with cpufreqd. Works perfectly fine. The sanity checks
that are missing from the code are presently in my head ... 

Actually I would like to try to mod my board somehow (being an
EE I am not too shy modding stuff :-) in order to change VIDs too. The
A7V8X is infamous for not supporting Vcore < 1.5V which is bad per se. If
I only knew what actually happens electrically-wise when setting the
VIDs. Do CPU pins change their logical level? Any insight is appreciated.

-- 
Philosophy will clip an angel's wings.
		-- John Keats
