From: David Pottage <david@chrestomanci.org>
Subject: Re: Spam coming from the list
Date: Mon, 27 Sep 2004 13:16:26 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <4158049A.1050509@chrestomanci.org>
References: <b01d37a4040926074578038cd8@mail.gmail.com>	<20040926162447.718973F03@latitude.mynet.no-ip.org>	<20040926215157.A11082@flint.arm.linux.org.uk>
	<200409271351.11475.fm3@os.inf.tu-dresden.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <200409271351.11475.fm3@os.inf.tu-dresden.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Frank Mehnert <fm3@os.inf.tu-dresden.de>
Cc: cpufreq@www.linux.org.uk

Frank Mehnert wrote:

>Hi,
>
>On Sunday 26 September 2004 22:51, Russell King wrote:
>  
>
>>On Sun, Sep 26, 2004 at 06:24:46PM +0200, aeriksson@fastmail.fm wrote:
>>    
>>
>>Disagree - peoples email systems actively reject spam, which causes
>>bounces.  The list interprets bounces as a failure of your address,
>>and with enough of them will disable and then unsubscribe you.
>>    
>>
>Bouncing EMails is evil since most time the sender ID of SPAM is faked.
>  
>
That depends on how the bounce system is implemented.

Some administrators interface their mail transport agent (sendmail, exim 
etc)
to their spam detector, so that during mail receipt, spam is detected,
the message is refused at that point. The sending mailserver receives
the bounce, and (hopefully) does not try again later.

-- 
David Pottage
