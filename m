From: Jan De Luyck <ml@kcore.org>
Subject: Re: sysfs cpufreq missing in 2.6.0
Date: Tue, 23 Dec 2003 19:05:31 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200312231905.31621.ml@kcore.org>
References: <3FE86F70.8060908@psu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <3FE86F70.8060908@psu.edu>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Nirmal Govind <nirmalg@psu.edu>, cpufreq@www.linux.org.uk

On Tuesday 23 December 2003 17:38, Nirmal Govind wrote:
> Hi,
>
> I compiled the 2.6.0 kernel (released on Dec. 18, downloaded from
> kernel.org) with the options enabled for userspace cpufreq.. the
> documentation says that sysfs will be used however I do not have any
> such device in /proc/sys/ or in /. I enabled the /proc/cpufreq so I
> do see a /proc/cpufreq but nothing similar to
> /sys/devices/system/cpu/cpu0/cpufreq/ as mentioned in the kernel
> documentation which also says that the sysfs devices will be created
> automatically. Here's what my /proc/sys/ looks like:

You have to mount the sysfs in /sys. Create the /sys directory with mkdir, and 
add this to your /etc/fstab

sysfs           /sys            sysfs           defaults         0    0

and run  a mount -a. Then you'll have the new sysfs system mounted.

Hope this helps.

Jan
-- 
An eye in a blue face
Saw an eye in a green face.
"That eye is like this eye"
Said the first eye,
"But in low place,
Not in high place."
