From: "Leisner, Martin" <Martin.Leisner@xerox.com>
Subject: RE: Overall picture of cpufreq..
Date: Fri, 11 Jan 2008 17:50:14 -0500
Message-ID: <556445368AFA1C438794ABDA8901891C07D6E1CC@USA0300MS03.na.xerox.net>
References: <9f79f7f50801111415w354dc91fwfeec98b16a00fb74@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <9f79f7f50801111415w354dc91fwfeec98b16a00fb74@mail.gmail.com>
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
To: Saru Addep <saru.dpm@gmail.com>, cpufreq@lists.linux.org.uk


>   -----Original Message-----
>   From: cpufreq-bounces@lists.linux.org.uk [mailto:cpufreq-
>   bounces@lists.linux.org.uk] On Behalf Of Saru Addep
>   Sent: Friday, January 11, 2008 5:15 PM
>   To: cpufreq@lists.linux.org.uk
>   Subject: Overall picture of cpufreq..
>   
>   Hi All,
>   
>   1) The kernel part of cpufreq seems quite understandable, but I am
not
>   able
>   to get a complete picture of how an application/process in userspace
can
>   use/change a governor, with an interface to kernel ( not from
command
>   line),
>   may be like an ioctl. Basically how can a userspace process change a
>   governor at runtime.
>   
You can either do

	system("echo ondemand
>/sys/devices/system/cpu/cpu0/scaling_governor")

or do

	fp = fopen("/sys/devices/system/cpu/cpu0/scaling_governor",
"w");
      if(!fp) error
      fprintf(fp, "ondemand");
      fclose(fp);


Very simple and (IMHO) elegant.

Much better than obscure ioctls.

marty
