From: Harald Milz <milz@seneca.muc.de>
Subject: Re: Manual PST settings for "unrecognized CPUs"
Date: Tue, 17 Aug 2004 08:26:34 +0200 (CEST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040817062634.6C2404BE94@nathan.muc.de>
References: <39e3484804081616133c2765ce@mail.gmail.com>
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
> I saw a patch fly by a short while ago where a user added some
> settings for an unrecognized config.  Is this the only way to hack in
> a PST?

Actually there were (at least) two patches - Bruno's patch which
implemented additional /proc fs entries to send frequency settings to, and
mine which uses command line parameters for the powernow-k7 module. You can
find them in the ML archive. Internally, they do basically the same thing.
Mine is a little inferior as far as sanity checks. But It Works For Me
[TM]. 

Please be advised that you _could_ potentially fry your CPU if you use them
:-) But IMHO it's quite unlikely. 

What these patches can't do is set the VID on most (?) desktop boards
because of a lack of hardware support. But you should be able to lower the
FID to a certain extent, and the power consumption is linearly proportional
to the frequency, after all. 

-- 
"Proper Preparation Prevents Poor Performance."
