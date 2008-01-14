From: Tomasz Chmielewski <mangoo@wpkg.org>
Subject: Re: Overall picture of cpufreq..
Date: Mon, 14 Jan 2008 08:08:50 +0100
Message-ID: <478B0A82.6050503@wpkg.org>
References: <9f79f7f50801111415w354dc91fwfeec98b16a00fb74@mail.gmail.com>	<1200264884.4157.16.camel@queen>
	<9f79f7f50801131812x6a68c202tb4c25fa2116b32e4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <9f79f7f50801131812x6a68c202tb4c25fa2116b32e4@mail.gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: Saru Addep <saru.dpm@gmail.com>
Cc: cpufreq@lists.linux.org.uk, Martin.Leisner@xerox.com

Saru Addep schrieb:
> Hi Thomas,
> 
> So that means if we have an ondemand governor properly instrumented, there
> is no need to have userspace governor. In the case of ondemand governor, the
> only work that will be left to userspace would be to set the min, and max
> freq. The complete intelligence of DVFS algoritm is present inside the
> ondemand governor. Is my understanding correct.

It looks to me that ondemand governor doesn't have "the complete 
intelligence".

For example, it doesn't detect CPU load coming from some kernel tasks, 
like kcryptd: reads/writes from a device crypted with dm-crypt will be 
very slow if one uses the ondemand governor, as CPU speed will always be 
set to the lowest possible (so there is not enough power to 
crypt/decrypt data).

Ironically, this is the only case when starting bzip2 will speed up your 
disk access... Or, use a userspace governor.


See also http://bugzilla.kernel.org/show_bug.cgi?id=9729


-- 
Tomasz Chmielewski
http://wpkg.org
